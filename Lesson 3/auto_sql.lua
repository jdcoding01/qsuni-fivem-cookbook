-- HOMEWORK: Instead of checking for one table, check for multiple
-- HINT: Check for the SQL content using string slicing to only 
-- execute the table you want
-- HINT: for loops


local tableName = 'testtable'
local pathToSql = 'queries.sql'
-- 'resources/name_of_resource/queries.sql'

-- Keep track if the database has been checked
local checked = false

local function log(message)
    print("[Database Check]: " .. message)
end

-- Check whether table exists or not
local function tableExists(callback)
    if checked then
        return
    end

    MySQL.Async.fetchScalar("SELECT COUNT(*) FROM information_schema.tables WHERE table_name = @table", {
        ['@table'] = tableName
    }, function(result)
        checked = true

        -- result from this query will be a string such as '10', 10
        if result and tonumber(result) > 0 then
            log("Table " .. tableName .. "exists. No action required...")
            callback(true)
        else
            log("Table " .. tableName .. "does not exist")
            callback(false)
        end
    end)
end

-- Function to insert SQL if table does not exist
local function executeSql()
    local file = io.open(pathToSql, "r") -- Open file and set the "r" flag for reading

    if not file then
        log("Error: Could not open SQL file at " .. pathToSql)
        return
    end

    local sqlContent = file:read("*all")
    file:close()

    if sqlContent and sqlContent ~= "" then
        -- Execute our sql query
        MySQL.Async.execute(sqlContent, {}, function(rowsChanged)
            log("SQL executed successfully. Rows affected: " .. rowsChanged)
        end)
    else
        log("Error: file is empty or could not be read")
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end

    log("Checking if table " .. tableName .. "exists")
    tableExists(function(exists)
        if not exists then
            executeSql()
        end
    end)
end)

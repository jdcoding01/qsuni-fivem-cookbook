# Data Types in Software Development  
Data types define the kind of data that can be stored and manipulated in a program. They help ensure data integrity, optimize memory usage, and prevent errors.  

---

## 1. Primitive Data Types  
Primitive types are the most basic types that a language provides.  

### a) Numeric Types  
| **Type**  | **Description** | **Example** |
|----------|---------------|------------|
| `Integer (int)` | Whole numbers (positive & negative) | `42`, `-10`, `1000` |
| `Floating-point (float, double)` | Decimal numbers (approximate values) | `3.14`, `-0.001`, `2.5e3` |
| `Boolean (bool)` | Represents `true` or `false` values | `true`, `false` |
| `Character (char)` | A single letter, digit, or symbol | `'A'`, `'7'`, `'#'` |

---

## 2. Composite Data Types  
These types store multiple values in a single unit.  

| **Type**  | **Description** | **Example** |
|----------|---------------|------------|
| `String` | Sequence of characters | `"Hello, World!"` |
| `Array` | Fixed-size collection of elements of the same type | `[1, 2, 3, 4]` |
| `List` | Dynamic-size collection of elements | `[10, "hello", 3.14]` |
| `Tuple` | Immutable collection of elements | `(1, "John", 3.5)` |
| `Dictionary (Map, HashTable, Table)` | Key-value pairs for fast lookup | `{"name": "Alice", "age": 25}` |
| `Set` | Collection of unique elements | `{1, 2, 3, 4}` |



## 4. User-Defined Data Types  
These types allow programmers to create their own structures.  

| **Type**  | **Description** | **Example** |
|----------|---------------|------------|
| `Struct/Interface` | Groups related variables under one type | `struct Car { string model; int year; }` |
| `Class` | Blueprint for objects (with properties & methods) | `class Dog { string name; void bark() }` |
| `Enum` | Defines a set of named constants | `enum Color { RED, GREEN, BLUE }` |

---

## 5. Special Data Types  
Some languages provide additional data types:  

| **Type**  | **Description** |
|----------|---------------|
| `Null/Nil/None` | Represents "no value" (JavaScript: `null`, Python: `None`) |
| `Any/Dynamic` | Holds any type (Python: `Any`, TypeScript: `any`, Dart `dynamic`) |

---


 ### String (`string`) 
 ```
 "hello"
 "24278924" -- NOT the same as 24278924
 "true" -- NOT the same as boolean
 ```
 
 ### Integer (`int`) Range
 > Integers are numbers, plain and simple

| **Type**        | **Bits** | **Range** |
|----------------|---------|------------------------------|
| `int8`  (1 byte)  | 8   | -128 to 127 |
| `uint8` (1 byte)  | 8   | 0 to 255 |
| `int16` (2 bytes) | 16  | -32,768 to 32,767 |
| `uint16` (2 bytes) | 16  | 0 to 65,535 |
| `int32` (4 bytes) | 32  | -2,147,483,648 to 2,147,483,647 |
| `uint32` (4 bytes) | 32  | 0 to 4,294,967,295 |
| `int64` (8 bytes) | 64  | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 |
| `uint64` (8 bytes) | 64  | 0 to 18,446,744,073,709,551,615 |

### Floating-Point (`float`) Range

> Floats are decimals

| **Type**       | **Bits** | **Approx. Range**             | **Precision** |
|---------------|---------|------------------------------|-------------|
| `float32` (4 bytes) | 32  | ±1.5 × 10⁻⁴⁵ to ±3.4 × 10³⁸  | ~7 digits  |
| `float64` (8 bytes) | 64  | ±5.0 × 10⁻³²⁴ to ±1.8 × 10³⁰⁸ | ~15 digits |


### Boolean (`bool`)

> Booleans are simply true or false, most evaluations will contain a boolean as result, binary code understands 0 as a false and 1 as a true

> IMPORTANT:
```
AND operator
false and false = false
true and age = 10
true and false = false because the "and" requires both to evaluate to true

OR
false or true = true
false or false = false
```

```js
var name = null;
var lastName = null;
var height = null;

if (name === "Alphi") {

}


var hasAddedName = name != null;

Ternary Operators

var hasAddedName = name != null ? lastName != null ? height != null ? "completed" : "incomplete" : "incomplete" : "incomplete" : null;
```

### Objects/Tables/Maps (`object`)

> Objects are key-value structures that allow for any data type storage, nesting and much more, live example will be given.

```lua

JSON Object
{
    "name": "Alphi",
    "items":  [
        {
            "itemName": "water_bottle",
            "itemCount": 5,
            "itemProperties": {
                "decay": 0.10,
                "consumable": true
            }
        }
    ],
}

LUA Table
{
  "name",
  "lastName"  
}
[
    "name",
    "lastName"
]
```


### Conditionals

> Conditionals evaluate whether a specific condition is met

```lua
LUA

name = "Alphi"
lastName = 5
hasRegistered = true

if name == "Alphi" and hasRegistered then
    print("Executed")
elseif name == "Kishi" then
    print("Executed")
else
    print("Error")
end
```

```js
JS

var name = "Alphi";

if (condition) {

}

switch(rank) {
    case 'admin':
        document.getElementById(rank).style.display = "block";
        break;
    case 'Kishi':
        console.log("Do this")
        break;
    default:
        console.log("Do that");
        break;
}
```

# Loops

```lua

admin = {
    "noclip",
    "godmode",
    ""
}


for _, data in ipairs(admin) do
    print(data)
end

stamina = 0

while stamina < 100 do
    stamina = stamina + 1
    Wait(1000)
end
```

```js
var stamina = 0;

const items = [
    "apples",
    "mango",
    "banana"
]

for (var i = 0; i < items.length; i++) {
    console.log("Whatever logic you want");
}

while (stamina < 100) {
    stamina++;
    setTimeout(4000);
}
```


# Functions

```lua


RegisterNetEvent('name', function(data)

end)

TriggerClient('name', data)



function name(name)
    print(name)
end


name("Alphi")
```

```JS


router.get('/hello', logic)



function logic(req, res) {}

```
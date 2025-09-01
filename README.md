# 🐫 OCaml Functional Programming  

This repository contains my OCaml codes and notes while learning **functional programming** and **data structures & algorithms (DSA)** using the OCaml language.  
All examples can be run directly in the **utop terminal**.  

---

## 📌 Topics Covered  

### 1. Basics of OCaml  
- Running OCaml in **utop**  
- Expressions & evaluation  
- Functions and recursion  
- Printing & debugging  

### 2. Data & Types  
- Lists and tuples  
- Records & variants  
- Pattern matching  
- Options and exceptions  
- Algebraic Data Types (ADTs)  

### 3. Functional Programming  
- Higher-order functions (map, filter, fold)  
- Currying and partial application  
- Pipelining (`|>` operator)  
- Immutable data structures  

### 4. Modular Programming  
- Modules and encapsulation  
- Functors (functions from modules to modules)  
- Abstract data types (ADTs) in modules  

### 5. Correctness & Testing  
- Unit testing with OUnit  
- Property-based testing with QCheck  
- Debugging in utop  

---

## 🛠️ How to Install OCaml on Ubuntu / Linux  

Open terminal (**CTRL+ALT+T**) and run the following commands:  

### 📌 Installation Steps  

```bash
# Update packages
sudo apt update

# Upgrade system
sudo apt full-upgrade

# Install required tools
sudo apt install zip unzip build-essential

# Install OPAM (OCaml Package Manager)
sudo apt install opam

# Initialize OPAM
opam init --bare -a -y

# Create a switch (OCaml compiler environment)
opam switch create pcc-cs301 ocaml-base-compiler 4.14.0

# Check available switches
opam switch list

# Install useful packages
opam install -y utop odoc ounit2 qcheck bisect-ppx mchir \
   ocaml-lsp-server ocamlformat-rpc

# Start OCaml REPL
utop
```

✅ Now you are ready to run OCaml programs 🚀  

---

## 🚀 Running Code  

1. Start OCaml interactive terminal:  
   ```bash
   utop
   ```

2. Load and run a file:  
   ```ocaml
   #use "filename.ml";;
   ```

3. Or type code directly in `utop`:  
   ```ocaml
   let rec fact n = if n = 0 then 1 else n * fact (n - 1);;
   fact 5;;
   ```

---

<h3 align="center">
  <b>Let's Connect!! </b>
  <img src="https://user-images.githubusercontent.com/74038190/214644145-264f4759-7633-441e-9d67-d8dda9d50d26.gif" width=95px>
</h3>

<p align="center">
  <a href="https://ujjwal-kamila.vercel.app/"><img src="https://img.shields.io/badge/Portfolio-Visit-blue?logo=Firefox&logoColor=white"></a>
  <a href="https://www.linkedin.com/in/ujjwal-kamila-8a12a4262/"><img src="https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white"></a>
  <a href="https://leetcode.com/ujjwalkamila86/"><img src="https://img.shields.io/badge/LeetCode-FFA116.svg?logo=LeetCode&logoColor=black"></a>
</p>

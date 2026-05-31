# Simulador de Queda com Resistência do Ar (Linear/Quadrática)

Este é um **simulador simples de queda vertical** que leva em conta a **resistência do ar**. Ele calcula a aceleração, velocidade e posição de um objeto ao longo do tempo, mostrando como a força do ar age contra o movimento.

---

## 🧪 Física por trás

O código utiliza:

### 1. Força da gravidade
\[
F_g = m \cdot g
\]

- `m` → massa do objeto (kg)  
- `g` → aceleração da gravidade (m/s²)  

### 2. Resistência do ar (força de arrasto)
\[
F_{ar} = - k \cdot v^2 \cdot \text{sign}(v)
\]

- `v` → velocidade do objeto (m/s)  
- `k` → constante do ar (N·s²/m²)  
- `sign(v)` → garante que a força sempre **se opõe ao movimento**

> Nota: no seu código atual você está usando a versão quadrática da resistência, mas poderia usar linear: `F_ar = -k * v`.

### 3. Aceleração e atualização
\[
F_{total} = F_g + F_{ar} \\
a = \frac{F_{total}}{m} \\
v = v + a \cdot dt \\
s = s + v \cdot dt
\]

- `dt` → intervalo de tempo por “tick” (s)  
- `s` → posição do objeto (m)

---

## 💻 Como usar

1. Defina os parâmetros no início do código:
```crystal
m = 100      # massa
g = 9.81     # gravidade
k = 0.1      # constante de resistência do ar
v = 1        # velocidade inicial
s = 10       # posição inicial
dt = 0.01    # passo de tempo

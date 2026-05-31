<div align="center">
  <img src="https://img.shields.io/badge/Crystal-000000?style=for-the-badge&logo=crystal&logoColor=white" alt="Crystal Badge"/>
  <img src="https://img.shields.io/badge/Physics-Simulation-blue?style=for-the-badge" alt="Physics Badge"/>
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License"/>

  <h1 style="border-bottom: none; margin-bottom: 0;">🪂 Simulador de Queda Livre</h1>
  <p style="font-size: 1.2em; color: #555; max-width: 600px; margin-top: 10px;">
    Um simulador de alto desempenho para modelar o movimento de queda vertical sob a influência da gravidade e do arrasto aerodinâmico.
  </p>
</div>

<hr style="border: 0; height: 1px; background: #ddd; margin: 40px 0;"/>

## 📝 Sobre o Projeto

Este software calcula dinamicamente a aceleração, a velocidade e a posição de um objeto ao longo do tempo através do método de **integração numérica de Euler**, permitindo analisar com precisão o comportamento físico e o conceito de **velocidade terminal**.

---

## 🧪 Fundamentos Físicos

A dinâmica do movimento é regida pela **Segunda Lei de Newton**:

$$F_{\text{total}} = m \cdot a$$

<details style="border: 1px solid #aaa; border-radius: 4px; padding: .5em .5em 0; margin-bottom: 15px;">
  <summary style="font-weight: bold; margin: -.5em -.5em 0; padding: .5em; cursor: pointer;">1. Força Gravitacional ($F_g$)</summary>
  <div style="padding: 10px;">
    <p>A força que puxa o objeto em direção ao centro da Terra:</p>
    $$F_g = m \cdot g$$
    <ul>
      <li><strong>m:</strong> Massa do objeto ($\text{kg}$)</li>
      <li><strong>g:</strong> Aceleração da gravidade ($\text{m/s}^2$)</li>
    </ul>
  </div>
</details>

<details style="border: 1px solid #aaa; border-radius: 4px; padding: .5em .5em 0; margin-bottom: 15px;">
  <summary style="font-weight: bold; margin: -.5em -.5em 0; padding: .5em; cursor: pointer;">2. Força de Resistência do Ar ($F_{\text{ar}}$)</summary>
  <div style="padding: 10px;">
    <p>O simulador suporta dois modelos de arrasto fluidodinâmico:</p>
    <ul>
      <li><strong>Modelo Quadrático</strong> (Altas velocidades / macro objetos):
        $$F_{\text{ar}} = -k \cdot v^2 \cdot \text{sign}(v)$$
      </li>
      <li><strong>Modelo Linear</strong> (Baixas velocidades ou fluidos muito viscosos):
        $$F_{\text{ar}} = -k \cdot v$$
      </li>
    </ul>
    <p><small><i>*Onde <strong>k</strong> é o coeficiente de arrasto e <strong>sign(v)</strong> garante que a força seja sempre oposta ao movimento.</i></small></p>
  </div>
</details>

<details style="border: 1px solid #aaa; border-radius: 4px; padding: .5em .5em 0; margin-bottom: 15px;">
  <summary style="font-weight: bold; margin: -.5em -.5em 0; padding: .5em; cursor: pointer;">3. Integração Numérica (Método de Euler)</summary>
  <div style="padding: 10px;">
    <p>A cada intervalo de tempo discreto ($dt$), as variáveis de estado são atualizadas:</p>
    $$a = \frac{F_g + F_{\text{ar}}}{m}$$
    $$v_{t + dt} = v_t + a \cdot dt$$
    $$s_{t + dt} = s_t + v_t \cdot dt$$
  </div>
</details>

---

## 🚀 Por que Crystal?

<table style="width: 100%; border-collapse: collapse; margin: 20px 0;">
  <tr style="background-color: #f8f9fa;">
    <th style="padding: 12px; border: 1px solid #dee2e6; text-align: left;">⚡ Performance de C</th>
    <th style="padding: 12px; border: 1px solid #dee2e6; text-align: left;">💎 Sintaxe Amigável</th>
    <th style="padding: 12px; border: 1px solid #dee2e6; text-align: left;">🛡️ Tipagem Estática</th>
  </tr>
  <tr>
    <td style="padding: 12px; border: 1px solid #dee2e6;">Compilado via LLVM, garantindo simulações com passos de tempo ($dt$) extremamente pequenos sem perda de desempenho.</td>
    <td style="padding: 12px; border: 1px solid #dee2e6;">Código limpo e expressivo semelhante ao Ruby, facilitando a legibilidade e modificação das equações.</td>
    <td style="padding: 12px; border: 1px solid #dee2e6;">Segurança em tempo de compilação sem sacrificar a velocidade de execução dos cálculos matemáticos.</td>
  </tr>
</table>

---

## 💻 Configuração e Parâmetros

No arquivo principal do simulador (`src/simulador.cr`), você encontrará as seguintes variáveis para customizar sua simulação:

```crystal
# Parâmetros de Simulação
m  = 100.0   # Massa do objeto (kg)
g  = 9.81    # Aceleração da gravidade (m/s²)
k  = 0.1     # Constante de resistência do ar (N·s²/m²)
v  = 0.0     # Velocidade inicial (m/s)
s  = 1000.0  # Altitude/Posição inicial (m)
dt = 0.01    # Diferencial de tempo / Passo de cálculo (s)

#simple variables
m = 100
g = 9.81
k = 0.1
v = 1
s = 10
dt = 0.01

def sign(v)
    if v > 0 
        return 1
    elsif v < 0
        return -1
    else
        return 0
    end
end

fg = m * g
f_ar = -k * (v*v) * sign(v)
f_total = fg + f_ar
a = f_total / m
v = v + a * dt
s = s + v * dt
puts f_ar

puts "força da gravidade #{fg}"
puts "força do ar #{f_ar}"
puts "força total #{f_total}"
puts "aceleração #{a}"
puts "velocidade #{v}"
puts "posição #{s}"



textoCor={}
function adiciona(cor,texto,pretotexto)
  local dict={red={1,0,0},blue={0,0,1},green={0,1,0},yellow={1,1,0},magenta={1,0,1},cyan={0,1,1},gray={0.5,0.5,0.5},white={1,1,1}}
  textoCor[#textoCor+1]=dict[cor]
  textoCor[#textoCor+1]=texto
  textoCor[#textoCor+1]={0,0,0}
  textoCor[#textoCor+1]=pretotexto
end

function adicionaprimeiro(texto)
  textoCor[#textoCor+1]={0,0,0}
  textoCor[#textoCor+1]=texto
end

function textoColorido(trad)
  textoCor={}
  trad:gsub("^([^<]*)",adicionaprimeiro)
  trad:gsub("<(.-):(.-)>([^<]*)", adiciona)
  return textoCor
end

function love.load()
  love.graphics.setBackgroundColor(0.9,0.9,0.9)
end
function love.draw()
  love.graphics.print(textoColorido("<red:Texto em vermelho, ><blue:seguido de azul.>"))
end

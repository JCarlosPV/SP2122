nombres{1} = 'Ciruclo';
nombres{2} = 'Cuadrado';
nombres{3} = 'Triangulo';

numClases = 3;
numImagenesPorClase = 2;

for i = 1: numClases
   for j = 1:numImagenesPorClase
       
       nombreImagne = [nombre(i) num2str(j, '%02d') '.jpg']; %dos digitos
       I = imread(nombreImagen);
   end
end
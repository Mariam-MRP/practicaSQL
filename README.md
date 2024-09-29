# practicaSQL
El diagrama entidad-relación   representa cómo las distintas entidades del sistema están relacionadas entre sí. Los componentes clave del diagrama son:		
Students: Los estudiantes pueden inscribirse  sólo a un bootcamp, pero cada bootcamp tiene muchos alumnos,  es decir la relación entre bootcamps y alumnos es de 1 a N.		
Teachers: La tambla de profesores, consiene los datos de los profesores que imparten los modulos. Cada profesor puede impartir varios modulos, es decir la relacion es de 1 a N.		
Modules: La tabla module, hace referencia a los ditintos modulos importados en los bootcamps, cada modulo puede pertenecer a varios bootcamps, y cada bootcamp tiene varios modulos, es decir su relacion es de N a N , y se relacionan a tarvés de la tabla intermedia Bootcamp_Module.		
Bootcamp_Modules: es una tabla intermedia que relaciona a los modulos con los bootcamps.		
Bootcamps: La tabla de bootcamps contiene la informacion relacionado con los bootcamps		


#!/bin/bash
#Órdenes para el Gestor de carga de trabajo (no intercalar instrucciones del scrip
#1. Asignar al trabajo un nombre
#SBATCH --job-name=helloOMP
#2. Asignar el trabajo a una partición (cola) 
#SBATCH --partition=ac4 
#3. Asignar el trabajo a un account 
#SBATCH --account=ac
#4. Para que el trabajo no comparta recursos 
#SBATCH --exclusive
#5. Para que se genere un único proceso del sistema operativo que pueda usar un máximo de 12 núcleos
#SBATCH --ntasks 1 --cpus-per-task 12
#Se pueden añadir más órdenas para el gestor de colas

export OMP_DYNAMIC=False

Instrucciones del script para ejecutar código:
echo -e "\n 1. Ejecución de SumaVectores para vectores globales varias veces (secuencial):\n"
for ((P=16384;P<=67108864;P=P*2))
do
   echo -e "  - Para vectores de $P componentes:\n"
   ./bin/globalSumaVectores $P
   echo -e "\n"
done

echo -e "\n\n\n\n 2. Ejecución sp-OpenMP-for varias veces (paralelizado):\n" 
for ((Q=16384;Q<=67108864;Q=Q*2))
do
   echo -e "  - Para vectores de $Q componentes:\n"
   ./bin/sp-OpenMP-for $Q
   echo -e "\n"
done

echo -e "\n\n\n\n 3. Ejecución sp-OpenMP-sections varias veces (paralelizado):\n" 
for ((R=16384;R<=67108864;R=R*2))
do
   echo -e "  - Para vectores de $R componentes:\n"
   ./bin/sp-OpenMP-sections $R
   echo -e "\n"
done



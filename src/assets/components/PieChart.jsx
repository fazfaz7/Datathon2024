import { Pie } from 'react-chartjs-2';
import {
  Chart as ChartJS, 
  Tooltip, 
  Legend, 
  ArcElement
} from 'chart.js';
import { useEffect, useState } from 'react';

ChartJS.register(
  Tooltip, 
  Legend, 
  ArcElement
)

export const PieChart = () => {
    const [data, setData] = useState({
        labels: [
          "Comida", "Ocio", "Vivienda", "Gasolina", "Otros"
        ],
        datasets: [
          {
            label: "Gastos",
            data: [1,1,1,1,1],
            backgroundColor: [
                "rgb(254, 160, 248)",
                "rgb(78, 217, 127)",
                "rgb(139, 227, 249)",
                "rgb(242, 166, 99)",
                "rgb(242, 211, 53)"
            ],
            hoverOffset: 4,
          }
        ]
      })
    
      useEffect(() => {
        let mydata = {
            labels: [
              "Comida", "Ocio", "Vivienda", "Gasolina", "Otros"
            ],
            datasets: [
              {
                label: "Gastos",
                data: [50, 25, 75, 85, 90],
                backgroundColor: [
                    "rgb(254, 160, 248)",
                    "rgb(78, 217, 127)",
                    "rgb(139, 227, 249)",
                    "rgb(242, 166, 99)",
                    "rgb(242, 211, 53)"
                ],
                hoverOffset: 4,
              }
            ]
          }
    setData(mydata)
      }, [])

      
  const options = {

  }

      return(
        <>
            <Pie options={options} data={data} />
        </>
      )
  }
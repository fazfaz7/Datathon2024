import { useEffect, useState } from 'react';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import { Doughnut } from 'react-chartjs-2';

ChartJS.register(ArcElement, Tooltip, Legend);

export const DoughChar = () => {
    const [data, setData] = useState({
        labels: [
          "Gastos", "Ingresos"
        ],
        datasets: [
          {
            data: [1000,1200],
            backgroundColor: [
                "rgb(241, 89, 56)",
                "rgb(78, 217, 127)"
            ],
            borderColor: [
                "rgb(241, 89, 56)",
                "rgb(78, 217, 127)"
            ],
            borderWidth: 1,
          }
          
        ]
      })
    
      useEffect(() => {
        let mydata = {
            labels: [
              "Gastos", "Ingresos"
            ],
            datasets: [
              {
                data: [1000,1200],
                backgroundColor: [
                    "rgb(241, 89, 56)",
                    "rgb(78, 217, 127)"
                ],
                borderColor: [
                    "rgb(241, 89, 56)",
                    "rgb(78, 217, 127)"
                ],
                borderWidth: 1,
              }
              
            ]
          }
        setData(mydata)
      }, [])

      
  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: "bottom"
      }
    }
  }

      return(
        <>
            <Doughnut options={options} data={data} />
        </>
      )
  }
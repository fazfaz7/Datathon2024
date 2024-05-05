import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import { useEffect, useState } from 'react';

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend
  )

  export const LineChart = () => {
    const [data, setData] = useState({
        labels: [
          "L", "M", "X", "J", "V", "S", "D"
        ],
        datasets: [
          {
            data: [0,0,0,0,0,0,0],
            borderColor: "rgb(45, 192, 192)"
          }
        ]
      })
    
      useEffect(() => {
        let mydata = {
          labels: [
            "L", "M", "X", "J", "V", "S", "D"
          ],
          datasets: [
            {
              data: [1500,0,0,0,500,0,2000],
              borderColor: "rgb(45, 192, 192)"
            }
          ],
        }
        setData(mydata)
      }, [])

      
  const options = {
    responsive: true,
    plugins: {
      legend: {
        display: false,
        position: "bottom"
      }
    }
  }

      return(
        <>
            <Line options={options} data={data} />
        </>
      )
  }
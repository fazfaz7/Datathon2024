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

  export const LineRetiroChart = (props) => {
    let saldoAct = props.saldoAct
    let onChangeFinal = props.handleChange
    const [ingreso, setIngreso] = useState(12000)
    const [tasa, setTasa] = useState(0.12)
    const [data, setData] = useState({
        labels: [
          2, 4, 6, 8, 10, 12, 14, 16, 18, 20
        ],
        datasets: [
          {
            data: [0,0,0,0,0,0,0, 0, 0, 0],
            borderColor: "rgb(45, 192, 192)"
          }
        ]
      })
    
      useEffect(() => {
        let earnings = []
        let saldoAnt = saldoAct
        for(let i = 2; i <= 20; i++){
            let newSaldo = saldoAnt * (1 + tasa) + ingreso;
            console.log("i" + i + ": " + newSaldo)
            if(i%2==0){
                earnings.push(newSaldo)
            }
            saldoAnt = newSaldo
            if(i%20==0){
                onChangeFinal(newSaldo)
            }
        }
        let mydata = {
          labels: [
            2, 4, 6, 8, 10, 12, 14, 16, 18, 20
          ],
          datasets: [
            {
              data: earnings,
              borderColor: "rgb(45, 192, 192)"
            }
          ],
        }
        setData(mydata)
      }, [tasa, ingreso, saldoAct])

      
  const options = {
    responsive: true,
    plugins: {
      legend: {
        display: false,
        position: "bottom"
      }
    }
  }

    const handleIngreso = (e) => {
        setIngreso(parseInt(e.target.value))
    }

    const handleTasa = (e) => {
        setTasa(parseInt(e.target.value)/100)
    }
  

      return(
        <>
            <div className='grid place-items-center'>
                <span className='text-[10px] text-gray-500'>Ingreso mensual</span>
                <input type='number' onChange={handleIngreso} className='w-24 h-8 m-2 text-[10px]'></input>
            </div>
            <div className='grid place-items-center'>
                <span className='text-[10px] text-gray-500'>Tasa</span>
                <input type='number' onChange={handleTasa} className='w-24 h-8 m-2 text-[10px]'></input>
            </div>
            <Line options={options} data={data} />
        </>
      )
  }
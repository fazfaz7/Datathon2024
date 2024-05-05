import { useEffect, useState } from 'react'

import heylogo from '../public/heylogowhite.png'
import actual from '../public/bx-dish.svg'
import fantasma from '../public/bx-ghost.svg'
import calendario from '../public/bxs-calendar.svg'
import './App.css'
import { LineDaysChart } from './assets/components/LineDaysChar'
import { Link } from 'react-router-dom'

const Analisis = (props) => {
  const [anomalos, setAnomalos] = useState([
    {
        "establecimiento": "Credit Card Payment",
        "cargo": "2298.09",
        "fecha": "01/03/2018"
    },
    {
        "establecimiento": "Mike's Construction Co.",
        "cargo": "8000.00",
        "fecha": "05/11/2018"
    },
    {
        "establecimiento": "Mike's Construction Co.",
        "cargo": "9200.00 ",
        "fecha": "06/20/2019"
    }
  ])

  return (
    <div>
      
      <div className='iphone'>
      </div>
      <div className='content'>

        <div className=' pt-10 px-6 w-full h-20 bg-heycolor rounded-t-3xl sticky top-0'>
          <img src={heylogo} className='h-6 inline-block'></img>
          <span className='ml-2 text-xs text-white'>Panchito</span>
        </div>
        <div className='pb-8 px-4'>

                <Link to={'/'} >
                    <button className='text-[6px] h-4 mt-1 p-1 bg-heycolor text-white font-semibold'>Atras</button>
                </Link>

            <div className=' bg-white mt-6 h-fit px-2 py-2'>
                <p className='text-[14px] inline-block font-semibold'><img src={calendario} className=' inline-block mr-1 w-5 h-5' />Tu actividad</p>
                <p className='text-[8px] mt-1'>A continuación se muestra el día en el que más se registran transacciones con tu dinero, en comparación con la tendencia. Dentro del gráfico los valores negativos están debajo de la tendencia de gastos y numeros positivos están sobre la tendencia de gastos.</p>
                <div className='grid place-items-center mb-4'>
                <p className='text-[14px] mt-4'>Viernes</p>
                </div>
                <LineDaysChart />
            </div>
            <div className=' bg-white mt-6 h-fit px-2 py-2'>
                <p className='text-[14px] inline-block font-semibold'><img src={actual} className=' inline-block mr-1 w-5 h-5' />Tendencias de gasto</p>
                <p className='text-[8px] mt-1'>De acuerdo a tus tendencias de compra e ingreso, has tenido una disminución en tus gastos. ¡Sigue asi! Invierte en tu fondo de retiro el dinero sobrante que tengas cada mes</p>
            </div>

            <div className=' bg-white mt-6 h-fit px-2 py-2'>
                <p className='text-[14px] inline-block font-semibold'><img src={fantasma} className=' inline-block mr-1 w-5 h-5' />Pagos anomalos</p>
                <p className='text-[8px] mt-1'>Recientemente se han detectado los siguientes pagos, que han sido marcados como anomálias ya que no se relacionan con tus tendencias de compras. Si tu no los realizaste, ¡pide una aclaración!</p>
                {anomalos.map((elem) => {
                    return(
                        <div key={elem.fecha} className='grid grid-cols-4 text-[10px] mt-2'>
                            <p>{elem.fecha}</p>
                            <p className='col-span-2'>{elem.establecimiento} </p>
                            <p className=' font-semibold'>${elem.cargo}</p> 
                        </div>
                    )
                })}
            </div>
        </div>

        <div className='menu sticky bottom-0 left-0 right-0 w-full h-20 bg-white p-4'>
            {/*Menu*/}
          </div>
      </div>
    </div>
  )
}

export default Analisis

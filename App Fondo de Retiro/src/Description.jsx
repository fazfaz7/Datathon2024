import { useEffect, useState } from 'react'

import heylogo from '../public/heylogowhite.png'
import ingresos from '../public/bx-trending-up.svg'
import egresos from '../public/bx-trending-down.svg'
import compare from '../public/bx-money-withdraw.svg'
import './App.css'
import { LineChart } from './assets/components/LineChar'
import { PieChart } from './assets/components/PieChart'
import { DoughChar } from './assets/components/DoughChar'
import { Link } from 'react-router-dom'

const Description = () => {
  const [count, setCount] = useState(0)

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
          <div className='grid place-items-center mt-4'>
            <p className='text-[18px] font-bold'>Control financiero</p>
            <p className='text-[7px] px-2 mt-1'>Monitorea tus movimientos, para tener un vistazo de tu situación financiera</p>
          </div>

          <div className=' bg-white mt-6 h-fit px-2 py-2'>
            <img src={ingresos} className=' inline-block mr-1 w-5 h-5' />
            <p className='text-[14px] inline-block font-semibold'>Ingresos</p>
            <p className='text-[8px] mt-1'>Descubre todos tus ingresos del último mes de manera detallada y organizada. Así como su diferencia entre frecuencia: fijo o variables.</p>
            <div id="chart" className='mt-4 p-1'>
              <LineChart />
            </div>
          </div>

          <div className=' bg-white mt-6 h-fit px-2 py-2'>
            <img src={egresos} className=' inline-block mr-1 w-5 h-5' />
            <p className='text-[14px] inline-block font-semibold'>Egresos</p>
            <p className='text-[8px] mt-1'>Descubre todos tus gastos del último mes de manera detallada y organizada. Así como su respectiva clasificación.</p>
            <div id="chart" className='mt-4 p-1'>
              <PieChart />
            </div>
            <div className='grid place-items-center'>
                <Link to={'/evaluacion'} >
                    <button className='text-[10px] h-8 mt-4 bg-heycolor text-white font-semibold py-1'>Analizar</button>
                </Link>
            </div>
          </div>

          <div className=' bg-white mt-6 h-fit px-2 py-2'>
            <img src={compare} className=' inline-block mr-1 w-5 h-5' />
            <p className='text-[14px] inline-block font-semibold'>Comparativa</p>
            <p className='text-[8px] mt-1'>Explora una visión completa de tu flujo de efectivo, teniendo una comparativa entre ingresos y egresos del último mes con detalle y organización.</p>
            <div id="chart" className='mt-4 p-1'>
              <DoughChar />
            </div>
            <div className='grid place-items-center'>
                <Link to={'/invierte'} >
                    <button className='text-[10px] h-8 mt-4 bg-heycolor text-white font-semibold py-1'>Invertir</button>
                </Link>
            </div>
          </div>

        </div>

        <div className='menu sticky bottom-0 left-0 right-0 w-full h-20 bg-white p-4'>
            
          </div>
      </div>
    </div>
  )
}

export default Description

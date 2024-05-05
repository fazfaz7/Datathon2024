import { useEffect, useState } from 'react'

import heylogo from '../public/heylogowhite.png'
import './App.css'
import ingresos from '../public/bx-trending-up.svg'
import actual from '../public/bx-dish.svg'
import { LineRetiroChart } from './assets/components/LineRetiroChar'
import { Link } from 'react-router-dom'

const PlanRetiro = () => {
  const [saldoAct, setSaldoAct] = useState(100)
  const [saldoFin, setSaldoFin] = useState(0)

  const handleChangeFin = (value) => {
    setSaldoFin(parseInt(value))
  }

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

                <Link to={'/invierte'} >
                    <button className='text-[6px] h-4 mt-1 p-1 bg-heycolor text-white font-semibold'>Atras</button>
                </Link>
            
            <div className='grid place-items-center mt-4'>
                <p className='text-[18px] font-bold'>Plan de retiro personal</p>
                <p className='text-[7px] px-2 mt-1'>Después de realizar tus gastos importantes del mes, guarda un poco del dinero que te sobró en un plan de inversión para tu retiro. A continuación podrás observat las ganancias que tendrías ¡si lo haces cada mes!</p>
            </div>
            
            <div className=' bg-white mt-6 h-fit px-2 py-2'>
            <p className='text-[14px] inline-block font-semibold'>Crecimiento de tu dinero</p>
            <p className='text-[8px] mt-1'>Calcula el crecimiento esperado de tu dinero en un plazo de tan solo 20 años</p>
                <p className='text-[14px] mt-4'><img src={actual} className=' inline-block mr-1 w-5 h-5' />Saldo actual: ${saldoAct}</p>
                <p className='text-[14px] mb-4' ><img src={ingresos} className=' inline-block mr-1 w-5 h-5' />Saldo final: ${saldoFin}</p>

          </div>

          <div className=' bg-white mt-6 h-fit px-2 py-2'>
            <div className='grid grid-cols-2'>
                <LineRetiroChart saldoAct={saldoAct} handleChange={handleChangeFin}/>
            </div>
          </div>

        </div>

        <div className='menu sticky bottom-0 left-0 right-0 w-full h-20 bg-white p-4'>
            
          </div>
      </div>
    </div>
  )
}

export default PlanRetiro;

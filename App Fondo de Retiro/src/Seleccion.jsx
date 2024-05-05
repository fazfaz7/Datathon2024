import { useEffect, useState } from 'react'

import heylogo from '../public/heylogowhite.png'
import actual from '../public/bx-dish.svg'
import ingresos from '../public/bx-trending-up.svg'
import './App.css'
import { Link } from 'react-router-dom'

const Seleccion = (props) => {
  const [count, setCount] = useState(0)
    const saldoAct = props.saldoAct? props.saldoAct : 500
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
                <p className='text-[14px] inline-block font-semibold'>Restante de efectivo</p>
                <p className='text-[8px] mt-1'>Este mes tuviste un sobrante de dinero, ¡felicidades! Te recomendamos que utilices una parte de este sobrante para iniciar un fondo para tu retiro</p>
                <p className='text-[14px] mt-4'><img src={actual} className=' inline-block mr-1 w-5 h-5' />Tu saldo restante: ${saldoAct}</p>
            </div>
            <div className=' bg-white mt-6 h-fit px-2 py-2'>
                <p className='text-[14px] inline-block font-semibold'>Cuenta de retiro</p>
                <p className='text-[8px] mt-1'>Explora un espacio seguro para planificar y gestionar tus ahorros para la jubilación de manera conveniente y accesible</p>
                <div className='grid place-items-center grid-cols-2'>
                    <p className='text-[12px] mt-4 col-span-2'><img src={ingresos} className=' inline-block mr-1 w-5 h-5' />¿Te gustaría implementar el instrumento financiero de Cuenta de Retiro?</p>
                    <Link to={'/retiro'}>
                        <button className='text-[10px] h-8 mt-4 bg-green-700 text-white font-semibold py-1'>Claro</button>
                    </Link>
                    <Link to={'/'} >
                        <button className='text-[10px] h-8 mt-4 bg-red-800 text-white font-semibold py-1'>Ahora no</button>
                    </Link>
                </div>
            </div>
                <div className='w-full h-96'></div>
        </div>

        <div className='menu sticky bottom-0 left-0 right-0 w-full h-20 bg-white p-4'>
            {/*Menu*/}
          </div>
      </div>
    </div>
  )
}

export default Seleccion

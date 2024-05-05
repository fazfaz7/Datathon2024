import './App.css'
import { RouterProvider, createBrowserRouter } from 'react-router-dom'
import Description from './Description';
import PlanRetiro from './PlanRetiro';
import Seleccion from './Seleccion';
import Analisis from './Analisis';


const router = createBrowserRouter([
  { path: "/", Component: Description },
  { path: "/retiro", Component: PlanRetiro },
  { path: "/invierte", Component: Seleccion },
  { path: "/evaluacion", Component: Analisis },
  { path: "*", Component: Description},
]);

function App() {
  return <RouterProvider router={router} />;
}

export default App

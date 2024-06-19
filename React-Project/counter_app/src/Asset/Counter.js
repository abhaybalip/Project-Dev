import { useState } from "react"

export const Counter = () => {
  const [count, setCount] = useState(0)

  const increment = () => {
    setCount(count + 1)
  }

  const decrement = () => {
    setCount(Math.max(count - 1, 0))
  }

  const reset = () => {
    setCount(0)
  }

  return (
    <div className="counter">
      <button className="counter-button" onClick={decrement}>-</button>
      <span className="counter-value">{count}</span>
      <button className="counter-button" onClick={increment}>+</button>
      <button className="counter-button" onClick={reset}>Reset</button>
    </div>
  )
}

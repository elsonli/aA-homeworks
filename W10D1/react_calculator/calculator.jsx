import React from 'react';

class Calculator extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      num1: "",
      num2: "",
      result: 0
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNumbers = this.addNumbers.bind(this);
    this.subtractNumbers = this.subtractNumbers.bind(this);
    this.multiplyNumbers = this.multiplyNumbers.bind(this);
    this.divideNumbers = this.divideNumbers.bind(this);
  }

  //your code here
  setNum1(event) {
    let currNum = event.currentTarget.value;
    this.setState({ num1: currNum });
  }

  setNum2(event) {
    let currNum = event.currentTarget.value;
    this.setState({ num2: currNum });
  }
  
  addNumbers(event) {
    event.preventDefault();
    debugger;
    this.setState({
      result: parseInt(this.state.num1) + parseInt(this.state.num2)
    });
  }

  subtractNumbers(event) {
    event.preventDefault();
    this.setState({
      result: parseInt(this.state.num1) - parseInt(this.state.num2)
    });
  }

  multiplyNumbers(event) {
    event.preventDefault();
    this.setState({
      result: parseInt(this.state.num1) * parseInt(this.state.num2)
    });
  }

  divideNumbers(event) {
    event.preventDefault();
    this.setState({
      result: parseInt(this.state.num1) / parseInt(this.state.num2)
    });
  }

  render() {
    const { num1, num2 } = this.state;
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={num1} />
        <input onChange={this.setNum2} value={num2} />
        <button onClick={this.addNumbers}>+</button>
        <button onClick={this.subtractNumbers}>-</button>
        <button onClick={this.multiplyNumbers}>*</button>
        <button onClick={this.divideNumbers}>/</button>
      </div>
    );
  }
}

export default Calculator;

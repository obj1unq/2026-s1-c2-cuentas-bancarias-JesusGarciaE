object casa {
  //  var saldoCorriente = 0
    //var saldoConGastos = 0
    //var saldo = 0
    //const costoDeOperacion = 10

    //method depositarCuentaCorriente() {
    //        saldoCorriente = saldoCorriente + saldo
    //}

    //method extraerCuentaCorriente(){
      //  saldoCorriente = saldoCorriente - saldo
    //} 

    //method setSaldo(_saldo){
     //   saldo = _saldo
    //}

    //method depositarCuentaConGastos(){
           // self.validarDeposito()
      //  saldoConGastos = saldoConGastos + saldo - costoDeOperacion
    //}

    //method extraerCuentaConGastos(){
    //    saldoConGastos = saldoConGastos - saldo - costoDeOperacion
    //}
    var gastosMensuales = 0
    var cuentaBancaria = cuentaCorriente
    method  gastos (monto){
        cuentaBancaria.extraer(monto)
        self.agregarAlMes(monto)
    }

    method agregarAlMes(monto){
        gastosMensuales = gastosMensuales + cuentaBancaria.saldoEnCuenta(monto)
    }

    method depositar(monto){
        cuentaBancaria.depositar(monto)
    }
    method cuentaBancaria (_cuentaBancaria){
        cuentaBancaria = _cuentaBancaria
    }

    method cambiarMes() {
        gastosMensuales = 0
    }
}

object cuentaCorriente {
    var saldoEnCuenta = 0 
    method depositar (monto){
            saldoEnCuenta = saldoEnCuenta + monto
    }

    method extraer (monto){
            saldoEnCuenta = saldoEnCuenta - monto
    }
    method saldoEnCuenta(_saldoEnCuenta){
        saldoEnCuenta = _saldoEnCuenta
    }
}

object cuentaConGastos {
    var saldoDeGastos = 0
    const costoDeOperacion = 20
    method depositar(monto){
            self.validarDeposito(monto)
            saldoDeGastos = saldoDeGastos + monto - costoDeOperacion
    }
    method extraer (monto) {
        saldoDeGastos = saldoDeGastos - monto - costoDeOperacion 
    }
    method validarDeposito (monto) {
        if (not (monto <= costoDeOperacion)) {
            self.error("saldo insuficiente")
        }
    }

}
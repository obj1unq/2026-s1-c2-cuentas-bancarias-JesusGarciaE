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
    var saldoEnCuenta = 0
    const costoDeOperacion = 20
    method depositar(monto){
            self.validarDeposito(monto)
            saldoEnCuenta = saldoEnCuenta + monto - costoDeOperacion
    }
    method extraer (monto) {
        saldoEnCuenta = saldoEnCuenta - monto - costoDeOperacion 
    }
    method validarDeposito (monto) {
        if (not (monto <= costoDeOperacion)) {
            self.error("saldo insuficiente")
        }
    }

}

object cuentaCombinada {
    var cuentaPrimaria = cuentaCorriente
    var cuentaSecundaria = cuentaConGastos
    method depositar(monto){
        cuentaPrimaria.depositar(monto)
    }
    method extraer(monto){
        if (cuentaPrimaria.saldoEnCuenta(monto) >= monto) {
            cuentaPrimaria.extraer(monto)
        } 
        else if (cuentaSecundaria.saldoEnCuenta(monto) >= monto) {
            cuentaSecundaria.extraer(monto)
        }
        else {
            self.error("saldo insuficiente")
        }
    }

    method cuentaPrimaria(_cuentaPrimaria){
        cuentaPrimaria = _cuentaPrimaria
    }
    method cuentaSecundaria(_cuentaSecundaria){
        cuentaSecundaria = _cuentaSecundaria
    }
}
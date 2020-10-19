package aspectsImp;

import ejemplo.cajero.modelo.Cuenta;

public aspect Retirar {
	
	pointcut logWithdrawOperation(): call (private * retirar (..) ); 
	
	before(): logWithdrawOperation () {
		Object[] args = thisJoinPoint.getArgs();
		Cuenta account = (Cuenta) args[0];
		String ammount = (String) args[1];
		String data = account.getNumero() + ";" + account.getSaldo() + ";" + ammount;
		Audit.auditLogFile("Retirar", data);
	}
	
}

package aspectsImp;

import ejemplo.cajero.modelo.Cuenta;

public aspect Transferir {
	pointcut logTransfer(): call (private * transferir (..) ); 

	before(): logTransfer() {
		Object[] args = thisJoinPoint.getArgs();
		Cuenta sourceAccount = (Cuenta) args[0];
		Cuenta destinationAccount = (Cuenta) args[1];
		String ammount = (String) args[2];
		String data = sourceAccount.getNumero() + ";" + sourceAccount.getSaldo() + ";" + destinationAccount.getNumero() + ";" + destinationAccount.getSaldo() + ";" + ammount;
		Audit.auditLogFile("Transferir", data);
	}
	
}

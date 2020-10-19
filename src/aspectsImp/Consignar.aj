package aspectsImp;

import ejemplo.cajero.modelo.Cuenta;

public aspect Consignar {
	
	pointcut logConsignOperation(): call (private * consignar (..) ); 
	
	before(): logConsignOperation () {
		Object[] args = thisJoinPoint.getArgs();
		Cuenta account = (Cuenta) args[0];
		String ammount = (String) args[1];
		String data = "C;" + account.getNumero() + ";" + account.getSaldo() + ";" + ammount;
		Audit.auditLogFile("Consignar", data);
	}

}

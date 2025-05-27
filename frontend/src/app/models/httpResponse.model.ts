export class HttpResponse<T> {

    // Definimos el tipo de status como un enum
    static Status = {
        SUCCESS: 'SUCCESS',
        FAIL: 'FAIL',
        ERROR: 'ERROR'
    };

    // Atributos de la clase
    status: string;   // El status será uno de los valores definidos en el enum Status
    message: string | null;  // message puede ser un String o null
    value: T | null;         // value puede ser de tipo T o null

    constructor(status: string, message: string | null, value: T | null) {
        this.status = status;
        this.message = message;
        this.value = value;
    }

    // Método toString() para representar el objeto como String
    toString(): string {
        return `HttpResponse { status: ${this.status}, message: ${this.message}, value: ${this.value} }`;
    }
}

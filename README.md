# Scripts

Scripts that execute a sequence of commands; makes it easy for administrators to perform specific tasks.

## Examples

"genclientcert" allows administrators to generate a client certificate (PEM) from a certificate request (CSR) in additon to a private key (.key file). Two certificate authority files are used (CA.crt and CA-private.pem as an example) to sign a certificate request to generate a certificate. An administrator only need to input a common name for the private key.

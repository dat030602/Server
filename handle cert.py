from OpenSSL import crypto
# $cert = New-SelfSignedCertificate -DnsName "172.16.55.117" -CertStoreLocation "cert:\LocalMachine\My"
# $certPassword = ConvertTo-SecureString -String "dat123" -Force -AsPlainText
# Export-PfxCertificate -Cert $cert -FilePath "D:\intern_NguyenVanDat\Odoo\docker\cert.pfx" -Password $certPassword

origin = "D:\intern_NguyenVanDat\Odoo\docker\certs\\172.16.55.117"
def extract_pfx(pfx_file, password):
    with open(pfx_file, 'rb') as f:
        pfx_data = f.read()
    p12 = crypto.load_pkcs12(pfx_data, password.encode('utf-8'))
    cert = p12.get_certificate()
    key = p12.get_privatekey()
    with open(f"{origin}\certificate.crt", 'wb') as cert_file:
        cert_file.write(crypto.dump_certificate(crypto.FILETYPE_PEM, cert))
    with open(f"{origin}\private_key.key", 'wb') as key_file:
        key_file.write(crypto.dump_privatekey(crypto.FILETYPE_PEM, key))

if __name__ == "__main__":
    pfx_file = 'cert.pfx'
    password = 'dat123'
    extract_pfx(pfx_file, password)

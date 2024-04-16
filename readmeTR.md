# IO Net Kurulum scripti (Ubuntu,Fedora,Arch Linux,Debian)

Bu depo, IO Net platformu için önkoşulları ayarlamak için bir Bash scripti içerir. Script, çeşitli Linux dağıtımları için tasarlanmış olup özellikle Nvidia GPU'lu sistemler için gerekli yapılandırmaları ele alır.


## Başlarken

Bu talimatlar, bu depodan kurulum scriptini nasıl kullanacağınızı size rehberlik edecektir.

### Önkoşullar

Scripti indirmek için sisteminizde 'curl' yüklü olduğundan emin olun.

- Kurulu değilse aşağıdaki komutu çalıştırarak yükleyin.<br>
     ```
     sudo apt install curl
     ``` 

### Terminal ile  Kurulum

1. **Kurulum scriptini indirin**:

   ```bash
   curl -L https://github.com/ozgeboztass/io-net-setup-script/raw/main/ionet-setup.sh -o ionet-setup.sh

2. Scripti çalıştırın:
   ```bash
   chmod +x ionet-setup.sh && ./ionet-setup.sh
   
## Script Genel Bakışı

`ionet-setup.sh` scripti şu işlemleri gerçekleştirir:

- Global değişkenler ayarlar ve işletim sistemi ile sürümünü belirler.
- Nvidia GPU varlığını kontrol eder ve belirlenen Linux dağıtımı ve sürümüne göre gerekli sürücüleri ve CUDA araçlarını kurar.
- Docker ve Docker Compose'u kurar ve bir Nvidia GPU algılanırsa Nvidia Docker'ı ayarlar.
- Kullanıcıyı Docker grubuna ekler.

## Desteklenen Dağıtımlar


- Ubuntu (20.04, 22.04, 18.04)
- Debian (10, 11)
- Arch Linux
- Fedora


## Katkılar

Bu scripte katkılarınızı bekliyoruz. Lütfen herhangi bir çekme isteğinin veya sorunun scriptin işlevselliği ve uyumluluğuyla ilgili olduğundan emin olun.


## Destek

Destek için lütfen bir sorun açın veya destek ekibimizle  [discord](https://discord.gg/kqFzFK7fg2) üzerinden iletişime geçin.

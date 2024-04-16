# IO Net-Installationsskript (Ubuntu,Fedora,Arch Linux,Debian)
Dieses Repository enthält ein Bash-Skript zum Einrichten der Voraussetzungen für die IO Net-Plattform. Das Skript ist für verschiedene Linux-Distributionen ausgelegt und geht speziell auf die notwendigen Konfigurationen für Systeme mit Nvidia-GPUs ein.

## Erste Schritte
Die folgenden Anweisungen zeigen Ihnen, wie Sie das Installationsskript aus diesem Repository verwenden.
### Voraussetzungen
Um das Skript herunterzuladen, stellen Sie sicher, dass Sie "curl" auf Ihrem System installiert haben.
- Falls nicht, installieren Sie es, indem Sie den folgenden Befehl ausführen.<br>
     ```
     sudo apt install curl
     ``` 
### Installation mit Terminal
1. **Laden Sie das Installationsskript herunter**:
   ```bash
   curl -L https://github.com/ozgeboztass/io-net-setup-script/raw/main/ionet-setup.sh -o ionet-setup.sh
2. führen Sie das Skript aus:
   ```bash
   chmod +x ionet-setup.sh && ./ionet-setup.sh
   
## Skript-Übersicht
Das Skript `ionet-setup.sh` führt die folgenden Operationen durch:
- Es setzt globale Variablen und bestimmt das Betriebssystem und die Version.
- Es prüft, ob ein Nvidia-Grafikprozessor vorhanden ist, und installiert die erforderlichen Treiber und CUDA-Tools entsprechend der angegebenen Linux-Distribution und -Version.
- Richtet Docker und Docker Compose ein und richtet Nvidia Docker ein, wenn eine Nvidia GPU erkannt wird.
- Fügt den Benutzer zu einer Docker-Gruppe hinzu.
## Unterstützte Distributionen

- Ubuntu (20.04, 22.04, 18.04)
- Debian (10, 11)
- Arch Linux
- Fedora

## Beiträge
Wir freuen uns über Ihre Beiträge zu diesem Skript. Bitte stellen Sie sicher, dass alle Anfragen oder Probleme sich auf die Funktionalität und Kompatibilität des Skripts beziehen.


clear
echo "******* TorPhantom Installer ********"
echo ""
if [ -f /etc/os-release ]; then
    source /etc/os-release
    case "$ID" in
        debian|ubuntu|linuxmint)
            echo ""
            echo "=====> Installing macchanger "
            sudo apt-get install macchanger -y -qq
            echo "=====> Installing tor bundle "
            sudo apt-get install tor -y -qq
            pip install -r requirements.txt
            echo "=====> Done "
            echo "=====> Open terminal and type 'python torphantom' for usage "
            ;;
        fedora|rhel|centos|rocky|alma)
            echo "=====> Installing macchanger "
            sudo yum -y -q macchanger
            echo "=====> Installing tor bundle "
            sudo yum -y -q tor
            pip install -r requirements.txt
            echo "=====> Done "
            echo "=====> Open terminal and type 'python torphantom' for usage "
            ;;
        arch|manjaro)
            echo "=====> Installing macchanger "
            sudo pacman -S --quiet --noconfirm --needed macchanger
            echo "=====> Installing tor bundle "
            sudo pacman -S --quiet --noconfirm --needed tor
            pip install -r requirements.txt
            echo "=====> Done "
            echo "=====> Open terminal and type 'python torphantom' for usage "
            ;;
        *)
            echo ""
            echo "=====> Installing macchanger "
            git clone https://github.com/InjectionSoftwareDevelopment/macchanger
            cd macchanger
            sudo chmod +x install.sh
            ./install.sh
            cd ../
            rm -rf macchanger
            echo "=====> Installing tor bundle "
            sudo port install tor
            sudo mv /opt/local/etc/tor/torrc.sample /opt/local/etc/tor/torrc
            pip install -r requirements.txt
            echo "=====> Done "
            echo "=====> Open terminal and type 'python torphantom' for usage "
            ;;
    esac
else
    echo "Unable to detect the distribution family."
fi
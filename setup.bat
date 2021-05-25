python utils\check_version.py || Exit /b
echo "1/4 Installing Speech to text"
cd rg_speech_to_text
git pull origin main
python -m venv venv
venv\Scripts\python -m pip install --upgrade pip setuptools
venv\Scripts\python -m pip install torch==1.7.1+cpu torchvision==0.8.2+cpu torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
venv\Scripts\python -m pip install sounddevice
venv\Scripts\python -m pip install pipwin
venv\Scripts\pipwin install pyaudio
venv\Scripts\python -m pip install sounddevice
venv\Scripts\python -m pip install -r requirements.txt
cd ..
echo "2/4 Installing Sound Generation"
cd rg_sound_generation\sound_generator
git pull origin main
python -m venv venv
venv\Scripts\python -m pip install --upgrade pip setuptools
venv\Scripts\python -m pip install -r requirements.txt
venv\Scripts\python -m pip install requests
venv\Scripts\python sound_generator\download_checkpoints.py
cd ..\..
echo "3/4 Installing Production"
cd rg_production
git pull origin main
python -m venv venv
venv\Scripts\python -m pip install --upgrade pip setuptools
venv\Scripts\python -m pip install -r requirements.txt
cd ..
echo "4/4 Installing Text to sound"
cd rg_text_to_sound
git pull origin main
bash -c "python3 -m venv venv; source venv/bin/activate; pip install --upgrade pip setuptools; pip install rgws; pip install git+https://git@github.com/TheSoundOfAIOSR/rg_text_to_sound.git#'subdirectory=tts_pipeline';"
cd ..
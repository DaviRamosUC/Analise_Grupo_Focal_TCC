import whisper

modelo = whisper.load_model("base")
resposta = modelo.transcribe("grupoFocal.mp3")

# Write the resposta variable to a txt file
with open("transcription.txt", "w", encoding="utf-8") as f:
  f.write(resposta["text"])
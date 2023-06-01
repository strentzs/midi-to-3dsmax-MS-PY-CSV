import mido
import csv

# Ouvrez le fichier MIDI
mid = mido.MidiFile('C:\\User\\Votre dossier\\Votre morceau.midi')

# Préparez un fichier CSV pour écrire les données
with open('midi_data.csv', 'w', newline='') as csvfile:
    fieldnames = ['note', 'velocity', 'time', 'duration']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()

    for i, track in enumerate(mid.tracks):
        time = 0
        for msg in track:
            time += msg.time
            if msg.type == 'note_on':
                duration = 0
                note_on_time = time
                note = msg.note
                velocity = msg.velocity
            elif msg.type == 'note_off' and msg.note == note:
                duration = time - note_on_time
                writer.writerow({'note': note, 'velocity': velocity, 'time': note_on_time, 'duration': duration})

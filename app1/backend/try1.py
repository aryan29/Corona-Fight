import face_recognition
known_image = face_recognition.load_image_file("1.jpg")
unknown_image = face_recognition.load_image_file("7.jpg")

known_encoding = face_recognition.face_encodings(known_image)[0]
f1 = open("aaa", "w")
print(known_encoding, file=f1)
f1.close
unknown_encoding = face_recognition.face_encodings(unknown_image)[0]

results = face_recognition.compare_faces([known_encoding], unknown_encoding)
print(results[0])

import face_recognition
import numpy as np
fp = open("1.jpg", "rb")
known_image = face_recognition.load_image_file(fp)
fp.close()
unknown_image = face_recognition.load_image_file("7.jpg")

known_encoding = face_recognition.face_encodings(known_image)[0]
unknown_encoding = face_recognition.face_encodings(unknown_image)[0]
unknown_encoding = unknown_encoding.tolist()
unknown_encoding = np.fromiter(unknown_encoding, float)
results = face_recognition.compare_faces([known_encoding], unknown_encoding)

print(type(known_encoding))
print(unknown_encoding)
print(unknown_encoding.tolist())
print(type(results[0]))

import requests
r = requests.post(
    "https://api.deepai.org/api/image-similarity",
    files={
        'image1': open('1.jpg', 'rb'),
        'image2': open('5.jpg', 'rb'),
    },
    headers={'api-key': 'd66a904a-3ff3-4f45-adea-231580cb521f'}
)
print(r.json())
# Or we can use microsoft Azure Api agr account khul parha h to

# Heat Map Purely Based on People in Correntine
import gmplot
import numpy as np
latitude1 = (np.random.random_sample(size=700))*5+17.5
longitude1 = (np.random.random_sample(size=700))*5+73.5
gm = gmplot.GoogleMapPlotter(
    19.7515, 75.7139, 8, "AIzaSyBjY9QF01OsfFXH83XyV9F5sZQRZGgQ1sQ")
gm.heatmap(latitude1, longitude1, radius=20, dissipating=True)
gm.draw("file.html")

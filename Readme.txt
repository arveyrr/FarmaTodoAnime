
1. Proyecto desarrollado con SwiftUI para la programación reactiva

2. Cocoapods:
 - SDWebImageSwiftUI: Para la carga de las imágenes
 - Alamofire: Para la conexión a la API
 - SwiftyJSON: Para la serialización y manejo de los datos recibidos, en ocasiones llegan nulos o con estructuras incorrectas

3. Para la persistencia de datos se utilizó UserDefaults

4. Se implementó el patrón de diseño MVVM

5. Carpeta Helpers
 - Se agrega archivo auxiliar para el SearchBar() dado en que SwiftUI aun no esta disponible
 - Se crea archivo de extensiones para extender las propiedades de algunos tipos y reutilizar código.
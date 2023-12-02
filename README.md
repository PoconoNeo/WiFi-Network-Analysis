# WiFi Network Analysis Tool

This project provides a simple yet powerful tool for WiFi network analysis. It includes a PowerShell script to sample WiFi data and an HTML file for displaying the current state of networks and historical signal strength charts.

## Features

- **Real-Time Data Sampling**: The PowerShell script samples WiFi network data, including SSIDs, signal strengths, and active status.
- **Historical Data Visualization**: The HTML page displays a table of current WiFi network data and generates historical charts for each SSID upon selection.
- **Interactive and User-Friendly**: Users can click on any SSID in the table to view its signal strength trend over time.
- **Local Web Server**: Utilizes a Python HTTP server to serve the HTML file and WiFi data locally.

## Usage

1. **Run the PowerShell Script**: Execute the `Wi-Fi-Analyser.ps1` script to start collecting WiFi data. The script samples data and saves it to `data.json`.

2. **Start the Python HTTP Server**: Navigate to the folder containing `index.html` and `data.json`, and run `python -m http.server`. This starts a local web server to serve these files.

3. **Open the HTML Page**: Open your web browser and go to `http://localhost:8000`. Load the `index.html` file to view the current WiFi data and click on any SSID to see its historical chart.

## Requirements

- PowerShell 5.1 or later for running the script.
- Python 3.x for the local HTTP server.
- A modern web browser (e.g., Chrome, Firefox, Edge).

## Contributing

Contributions to the WiFi Network Analysis Tool are welcome! Feel free to fork this repository and submit pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

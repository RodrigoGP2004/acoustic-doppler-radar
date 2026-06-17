# acoustic-doppler-radar
MATLAB simulation and experimental signal processing (FFT) for an acoustic speed radar based on the Doppler effect, exploring its feasibility. 

This is a first-year undergraduate physics project developed for the Computation I module, combining both computational modeling and experimental data processing. It extracts the varying frequency of an approaching/receding sound source and calculates its velocity.

### Key Features:
1. **Signal Processing:** 
   - Reads raw audio files (`.mp3`, `.m4a`).
   - Applies **Fast Fourier Transforms (FFT)** to time-sliced audio segments to extract peak frequencies over time.
2. **Physical Modeling:** 
   - Models the 2D Doppler effect, accounting for the radial distance to the observer ($h$) and external factors like wind speed and direction.
3. **Data Visualization:** 
   - Generates 2D frequency-position fits and 3D surface plots mapping frequency variations against source velocity and position.

## Repository Structure

- `scripts/`: Contains all the MATLAB source code (`.m` files).
  - `Final.m`: Main script for experimental audio slicing, FFT application, and speed calculation.
  - `Simulacion.m`: Theoretical Doppler shift simulator predicting frequency vs. position.
  - `Grafica3D.m`: 3D visualization of the parameter space.
- `data/`: Sample audio files used for experimental testing.
- `docs/`: Full project report detailing the mathematical framework and experimental results (in Spanish).

import matplotlib.pyplot as plt
import numpy as np

# Data
sms = [8, 16, 24, 32, 48, 64, 80, 96]

a100_dispatch = [93.70, 168.22, 227.82, 266.13, 281.38, 316.23, 308.42, 300.53]
a100_combine = [63.77, 119.10, 162.95, 209.61, 271.21, 304.56, 304.09, 301.05]

h100_dispatch = [125.38, 233.71, 318.09, 391.79, 486.17, 521.91, 447.14, 532.82]
h100_combine = [96.79, 179.31, 249.56, 311.96, 406.03, 451.28, 529.77, 506.91]

# Set up figure with a specific size for the poster
plt.figure(figsize=(10, 6))

# Create plot with markers and lines
plt.plot(sms, h100_dispatch, '-o', color='#1f77b4', linewidth=2, markersize=8, label='H100 Dispatch')
plt.plot(sms, h100_combine, '-^', color='#1f77b4', linewidth=2, markersize=8, alpha=0.7, label='H100 Combine')
plt.plot(sms, a100_dispatch, '-s', color='#ff7f0e', linewidth=2, markersize=8, label='A100 Dispatch')
plt.plot(sms, a100_combine, '-D', color='#ff7f0e', linewidth=2, markersize=8, alpha=0.7, label='A100 Combine')

# Add grid for better readability
plt.grid(True, linestyle='--', alpha=0.7)

# Add labels and title
plt.xlabel('Number of SMs', fontsize=14)
plt.ylabel('Throughput (tokens/s)', fontsize=14)
plt.title('DeepEP Throughput Scaling with SM Count', fontsize=16, fontweight='bold')

# Set x-axis ticks explicitly to match our data points
plt.xticks(sms)

# Add legend with clear positioning
plt.legend(loc='upper left', fontsize=12)

# Add vertical lines to show optimal SM counts (optional)
optimal_h100 = 96  # SM count with highest H100 throughput
optimal_a100 = 64  # SM count with highest A100 throughput
plt.axvline(x=optimal_h100, color='#1f77b4', linestyle='--', alpha=0.3)
plt.axvline(x=optimal_a100, color='#ff7f0e', linestyle='--', alpha=0.3)

# Annotate optimal points
# plt.annotate(f'H100 optimal', xy=(optimal_h100, 530), 
#              xytext=(optimal_h100-15, 560),
#              fontsize=10, color='#1f77b4')
# plt.annotate(f'A100 optimal', xy=(optimal_a100, 316), 
#              xytext=(optimal_a100-10, 350),
#              fontsize=10, color='#ff7f0e')

# Add text for key findings
plt.text(10, 100, "Key findings:\n• H100 shows ~1.7x throughput vs A100\n• Optimal SM count differs by architecture",
         bbox=dict(facecolor='white', alpha=0.7, boxstyle='round,pad=0.5'), fontsize=10)

# Ensure the layout is tight and looks good
plt.tight_layout()

# Save the figure in high resolution for the poster
plt.savefig('deepep_throughput.png', dpi=300, bbox_inches='tight')

# Show the plot
plt.show()
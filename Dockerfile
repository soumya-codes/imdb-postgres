# Use an appropriate base image
FROM postgres:16.2

# Install any additional tools if needed (psql is already included with the base image)
# Example: RUN apt-get update && apt-get install -y some-tool

# Copy the scripts into the container
COPY /scripts/init_and_load.sql /scripts/init_and_load.sql
COPY /scripts/load_data.sh /scripts/load_data.sh

# Make sure the scripts are executable
RUN chmod +x /scripts/load_data.sh

# Define the entrypoint script
ENTRYPOINT ["/scripts/load_data.sh"]
# Use an official lightweight Python image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Copy the requirements file to the container
COPY requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Copy the application code to the container
COPY . ./

# Expose the port that the app will run on
EXPOSE 8080

# Set the default port to listen on
ENV PORT 8080

# Specify the command to run when the container starts
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app

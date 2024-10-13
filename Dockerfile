# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Expose the port Flask runs on
EXPOSE 5000

# Define environment variables (can be overridden by docker-compose)
ENV OPENAI_API_KEY=your_default_api_key
ENV MYSQL_HOST=mysql
ENV MYSQL_DBNAME=z-saas
ENV MYSQL_USER=vanna
ENV MYSQL_PASSWORD=password
ENV MYSQL_PORT=3306
ENV OPENAI_MODEL=gpt-4

# Run the application
CMD ["python", "app.py"]

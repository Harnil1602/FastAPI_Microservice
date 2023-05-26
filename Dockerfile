FROM arm64v8/python

# Copy your application code
COPY . /app

# Set the working directory
WORKDIR /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose the required port
EXPOSE 8000

# Set the command to run your FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


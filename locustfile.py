from locust import HttpUser, task, between

class MyUser(HttpUser):
    wait_time = between(1, 3)  # Wait between 1 to 3 seconds between tasks

    @task
    def get_scores(self):
        self.client.get("/")

import collections
from unittest import TestCase

from tensorflow.python.keras.models import Sequential

from src.trainer.task import train_and_evaluate


class TestExample(TestCase):
    def test_train_and_evaluate_should_return_a_keras_model(self):
        Args = collections.namedtuple('Args', ['learning_rate', 'num_epochs', 'batch_size', 'job_dir',])
        args = Args(learning_rate=0.1, num_epochs=1, batch_size=128, job_dir='local-training-output')

        model = train_and_evaluate(args)

        self.assertIsInstance(model, Sequential)

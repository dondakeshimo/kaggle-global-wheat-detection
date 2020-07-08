from typing import Dict

import numpy as np
import pandas as pd


def create(config: Dict):
    marking = pd.read_csv()

    bboxs = np.stack(marking['bbox'].apply(
        lambda x: np.fromstring(x[1:-1], sep=',')))

    for i, column in enumerate(['x', 'y', 'w', 'h']):
        marking[column] = bboxs[:, i]

    marking.drop(columns=['bbox'], inplace=True)

    return marking

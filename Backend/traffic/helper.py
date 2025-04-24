from deepface import DeepFace

def generate_embedding(image_path):
    embeddings = DeepFace.represent(image_path, model_name="Facenet")
    return embeddings

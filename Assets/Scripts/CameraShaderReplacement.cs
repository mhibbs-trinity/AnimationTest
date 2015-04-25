using UnityEngine;
using System.Collections;

public class CameraShaderReplacement : MonoBehaviour {

	public Shader globalShader;

	// Use this for initialization
	void Start () {
		GetComponent<Camera> ().SetReplacementShader (globalShader, "");
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}

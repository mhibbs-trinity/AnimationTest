using UnityEngine;
using System.Collections;

public class RotateLightDirection : MonoBehaviour {

	public float rotateSpeed = 0.1f;
	private Transform litTrans;

	// Use this for initialization
	void Start () {
		litTrans = GetComponent<Transform> ();
	}
	
	// Update is called once per frame
	void Update () {
		litTrans.Rotate (Time.deltaTime * rotateSpeed, 0, 0);
	}
}

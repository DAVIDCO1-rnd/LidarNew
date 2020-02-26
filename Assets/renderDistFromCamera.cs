using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class renderDistFromCamera : MonoBehaviour
{
    Shader replacementShader;
    Camera cam; 

    void Start()
    {
        replacementShader = Shader.Find("LidarSensor/Depth");
        cam = GetComponent<Camera>();
        if (replacementShader != null)
            cam.SetReplacementShader(replacementShader, "");
    }

    void Update()
    {
        
    }
}

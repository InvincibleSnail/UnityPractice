using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UnityPractice
{
    public class Plane : MonoBehaviour
    {
        private int direction = 1;
        // Start is called before the first frame update
        void Start()
        {
        
        }

        // Update is called once per frame
        void Update()
        {
            if (this.transform.position.y >= 1) direction = -1;
            if (this.transform.position.y <= -1) direction = 1;
            Vector3 pos = this.transform.position;
            this.transform.position = new Vector3(pos.x, pos.y + Time.deltaTime * direction, pos.z);
        }
    }
}
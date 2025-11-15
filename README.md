# Encrypted Survey System

A fully homomorphic encryption (FHE) based survey system built on Ethereum with Zama's fhEVM.

## Features

- **Privacy-Preserving**: Responses are encrypted using fully homomorphic encryption
- **Zero-Knowledge**: Contract computations happen on encrypted data
- **Controlled Access**: Only authorized viewers can decrypt final results
- **Time-Bound**: Surveys can have expiration dates and response limits
- **Emergency Controls**: Admin can pause/unpause surveys

## Architecture

- **Smart Contract**: Solidity contract using fhEVM for encrypted operations
- **Frontend**: Next.js React application with TypeScript
- **Encryption**: Zama's fhEVM for homomorphic encryption operations

## Deployment

The system is deployed on Sepolia testnet with the following features:
- Encrypted survey creation and management
- Privacy-preserving response collection
- Authorized result decryption

## Demo

Check out the live demo at: https://questionnaire-axxpp.vercel.app/

## Security

This system uses cutting-edge cryptographic techniques to ensure:
- Response privacy during collection
- Encrypted computation on-chain
- Controlled decryption access
